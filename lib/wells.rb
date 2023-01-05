require 'json'
require "matrix"
class Wells

    PLATE_SIZES = [96, 384] # 96 = 8x12, 386 = 16x24

    def self.optimize_placement(plate_size, samples_array, reagents_array, replicates)
        #puts self.validate_plate_size(plate_size)
        #puts self.is_input_valid?([samples_array.length,reagents_array.length,replicates.length])
        if 
            self.validate_plate_size(plate_size) &&
            self.is_input_valid?([samples_array.length,reagents_array.length,replicates.length])

            ordered_samples = order_samples(samples_array)
            prepared_reagents = prepare_reagents(reagents_array, replicates)

            # how many lines on wells do we need?
            required_well_lines = count_well_lines(plate_size, ordered_samples.length)
            # how many columns on wells do we need?
            required_well_columns = count_well_columns(plate_size, prepared_reagents.length)

            product_vector = ordered_samples.product(prepared_reagents)
            product_matrix = product_vector.each_slice(prepared_reagents.length).to_a
            # fill with nil columns to prepare the complete plates
            product_matrix.map! { |row| fixed_array_row(plate_size,required_well_columns,row) }
            # fill with nil rows to complete plates
            while product_matrix.length < required_well_lines
                product_matrix << Array.new(required_well_columns) {nil}
            end

            # use some matrix magic instead of manually going throug arrays of arrays
            matrix = Matrix.rows(product_matrix)

            plates = split_matrix_to_plates(matrix,plate_size)
            
            puts JSON.pretty_generate(plates)

            plates
        end
    end

    private
    ### just make sure the plate is one of available sizes
    def self.validate_plate_size plate_size
        PLATE_SIZES.include?(plate_size.to_i)
    end

    ### array lengths must be the same for samples, reagents, replicates, because the corresponing value represents the same experiment
    def self.is_input_valid? input_lengths
        input_lengths.uniq.length == 1        
    end

    ### optimize samples
    def self.order_samples samples
        # read all different samples
        all_samples = samples.flatten
        # and remove duplicates, since the same sample-reag combination means the same experiment
        optimized_samples = all_samples.uniq.sort

        # return optimized samples
        optimized_samples.flatten
    end

    # prepare reagents
    def self.prepare_reagents reagents, replicates
        prepared_replicates = []
        replicates.each_with_index do |replicate,idx|
            temp_array = []
            replicate.times do 
                temp_array << reagents[idx]
            end
            prepared_replicates << temp_array.flatten.sort
        end
        prepared_replicates.flatten
    end

    # prepare enough wells to get each sample in its own line
    def self.count_well_lines plate_size, samples_count
        if plate_size == 96
            ((samples_count-1)/8+1)*8
        elsif plate_size == 384
            ((samples_count-1)/16+1)*16
        end
    end

    # prepare enough wells to get all reagents for experiemnts*replicates
    def self.count_well_columns plate_size, reagents_count
        if plate_size == 96
            ((reagents_count-1)/12+1)*12
        elsif plate_size == 384
            ((reagents_count-1)/24+1)*24
        end
    end

    # fill the array with nils to get correct array size
    def self.fixed_array_row plate_size, size, arr
        Array.new(size) { |i| arr[i] }
    end

    # tkae the matrix and split into plates
    def self.split_matrix_to_plates matrix, plate_size
        if plate_size == 96
            columns = 12
            rows = 8
        elsif plate_size == 384
            columns = 24
            rows = 16
        end
        plates_in_row = matrix.row_size/rows
        plates_in_column = matrix.column_size/columns

        plates = []
        plates_in_row.times do |row|
            plates_in_column.times do |column|
                plates << matrix.minor(row*rows..(row+1)*rows-1,column*columns..(column+1)*columns-1).to_a
            end
        end
        plates
    end

end