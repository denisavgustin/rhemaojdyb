require 'wells'
require 'json'
RSpec.describe Wells do
    context '96 wells' do
        context "prepare plates" do
            it 'should repond with a single plate result' do
                plates = Wells.optimize_placement(96,[['Sam 1', 'Sam 2', 'Sam 3'], ['Sam 1', 'Sam 3', 'Sam 4']],[['Reag X', 'Reag Y'], ['Reag Y', 'Reag Z']],[1,3])

                expect(plates.length).to eq(1)
            end

            it 'should respond with two plate, same as the provided result' do
                plates = Wells.optimize_placement(96,[['Sam 1', 'Sam 2', 'Sam 3','Sam 4','Sam 5','Sam 6', 'Sam 7','Sam 8'], ['Sam 1', 'Sam 3', 'Sam 4','Sam 9'],['Sam 1','Sam 10']],[['Reag X', 'Reag Y'], ['Reag Y', 'Reag Z'],['Reag W']],[1,3,4])
                expect(plates.to_json).to eq('[[[["Sam 1","Reag X"],["Sam 1","Reag Y"],["Sam 1","Reag Y"],["Sam 1","Reag Y"],["Sam 1","Reag Y"],["Sam 1","Reag Z"],["Sam 1","Reag Z"],["Sam 1","Reag Z"],["Sam 1","Reag W"],["Sam 1","Reag W"],["Sam 1","Reag W"],["Sam 1","Reag W"]],[["Sam 10","Reag X"],["Sam 10","Reag Y"],["Sam 10","Reag Y"],["Sam 10","Reag Y"],["Sam 10","Reag Y"],["Sam 10","Reag Z"],["Sam 10","Reag Z"],["Sam 10","Reag Z"],["Sam 10","Reag W"],["Sam 10","Reag W"],["Sam 10","Reag W"],["Sam 10","Reag W"]],[["Sam 2","Reag X"],["Sam 2","Reag Y"],["Sam 2","Reag Y"],["Sam 2","Reag Y"],["Sam 2","Reag Y"],["Sam 2","Reag Z"],["Sam 2","Reag Z"],["Sam 2","Reag Z"],["Sam 2","Reag W"],["Sam 2","Reag W"],["Sam 2","Reag W"],["Sam 2","Reag W"]],[["Sam 3","Reag X"],["Sam 3","Reag Y"],["Sam 3","Reag Y"],["Sam 3","Reag Y"],["Sam 3","Reag Y"],["Sam 3","Reag Z"],["Sam 3","Reag Z"],["Sam 3","Reag Z"],["Sam 3","Reag W"],["Sam 3","Reag W"],["Sam 3","Reag W"],["Sam 3","Reag W"]],[["Sam 4","Reag X"],["Sam 4","Reag Y"],["Sam 4","Reag Y"],["Sam 4","Reag Y"],["Sam 4","Reag Y"],["Sam 4","Reag Z"],["Sam 4","Reag Z"],["Sam 4","Reag Z"],["Sam 4","Reag W"],["Sam 4","Reag W"],["Sam 4","Reag W"],["Sam 4","Reag W"]],[["Sam 5","Reag X"],["Sam 5","Reag Y"],["Sam 5","Reag Y"],["Sam 5","Reag Y"],["Sam 5","Reag Y"],["Sam 5","Reag Z"],["Sam 5","Reag Z"],["Sam 5","Reag Z"],["Sam 5","Reag W"],["Sam 5","Reag W"],["Sam 5","Reag W"],["Sam 5","Reag W"]],[["Sam 6","Reag X"],["Sam 6","Reag Y"],["Sam 6","Reag Y"],["Sam 6","Reag Y"],["Sam 6","Reag Y"],["Sam 6","Reag Z"],["Sam 6","Reag Z"],["Sam 6","Reag Z"],["Sam 6","Reag W"],["Sam 6","Reag W"],["Sam 6","Reag W"],["Sam 6","Reag W"]],[["Sam 7","Reag X"],["Sam 7","Reag Y"],["Sam 7","Reag Y"],["Sam 7","Reag Y"],["Sam 7","Reag Y"],["Sam 7","Reag Z"],["Sam 7","Reag Z"],["Sam 7","Reag Z"],["Sam 7","Reag W"],["Sam 7","Reag W"],["Sam 7","Reag W"],["Sam 7","Reag W"]]],[[["Sam 8","Reag X"],["Sam 8","Reag Y"],["Sam 8","Reag Y"],["Sam 8","Reag Y"],["Sam 8","Reag Y"],["Sam 8","Reag Z"],["Sam 8","Reag Z"],["Sam 8","Reag Z"],["Sam 8","Reag W"],["Sam 8","Reag W"],["Sam 8","Reag W"],["Sam 8","Reag W"]],[["Sam 9","Reag X"],["Sam 9","Reag Y"],["Sam 9","Reag Y"],["Sam 9","Reag Y"],["Sam 9","Reag Y"],["Sam 9","Reag Z"],["Sam 9","Reag Z"],["Sam 9","Reag Z"],["Sam 9","Reag W"],["Sam 9","Reag W"],["Sam 9","Reag W"],["Sam 9","Reag W"]],[null,null,null,null,null,null,null,null,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null,null]]]')
                expect(plates.length).to eq(2)
            end
        end

        context 'wrong params' do
            it 'should return nil when wrong plate size is provided' do
                plates = Wells.optimize_placement(100,[['Sam 1', 'Sam 2', 'Sam 3'], ['Sam 1', 'Sam 3', 'Sam 4']],[['Reag X', 'Reag Y'], ['Reag Y', 'Reag Z']],[1,3])

                expect(plates).to be(nil)
            end

            it 'should return nil when samples and reagents arrays are not the same size' do
                plates = Wells.optimize_placement(100,[['Sam 1', 'Sam 2', 'Sam 3'], ['Sam 1', 'Sam 3', 'Sam 4']],[['Reag X', 'Reag Y'], ['Reag Y', 'Reag Z'],['Reag Q']],[1,3])

                expect(plates).to be(nil)
            end
        end
    end

    context '384 wells' do
        context "prepare plates" do
            it 'should repond with a single plate result' do
                plates = Wells.optimize_placement(384,[['Sam 1', 'Sam 2', 'Sam 3'], ['Sam 1', 'Sam 3', 'Sam 4']],[['Reag X', 'Reag Y'], ['Reag Y', 'Reag Z']],[1,3])

                expect(plates.length).to eq(1)
            end

            it 'should respond with two plate, same as the provided result' do
                plates = Wells.optimize_placement(384,[['Sam 1', 'Sam 2', 'Sam 3','Sam 4','Sam 5','Sam 6', 'Sam 7','Sam 8'], ['Sam 1', 'Sam 3', 'Sam 4','Sam 9'],['Sam 1','Sam 10']],[['Reag X', 'Reag Y'], ['Reag Y', 'Reag Z'],['Reag W']],[1,3,4])
                expect(plates.to_json).to eq('[[[["Sam 1","Reag X"],["Sam 1","Reag Y"],["Sam 1","Reag Y"],["Sam 1","Reag Y"],["Sam 1","Reag Y"],["Sam 1","Reag Z"],["Sam 1","Reag Z"],["Sam 1","Reag Z"],["Sam 1","Reag W"],["Sam 1","Reag W"],["Sam 1","Reag W"],["Sam 1","Reag W"],null,null,null,null,null,null,null,null,null,null,null,null],[["Sam 10","Reag X"],["Sam 10","Reag Y"],["Sam 10","Reag Y"],["Sam 10","Reag Y"],["Sam 10","Reag Y"],["Sam 10","Reag Z"],["Sam 10","Reag Z"],["Sam 10","Reag Z"],["Sam 10","Reag W"],["Sam 10","Reag W"],["Sam 10","Reag W"],["Sam 10","Reag W"],null,null,null,null,null,null,null,null,null,null,null,null],[["Sam 2","Reag X"],["Sam 2","Reag Y"],["Sam 2","Reag Y"],["Sam 2","Reag Y"],["Sam 2","Reag Y"],["Sam 2","Reag Z"],["Sam 2","Reag Z"],["Sam 2","Reag Z"],["Sam 2","Reag W"],["Sam 2","Reag W"],["Sam 2","Reag W"],["Sam 2","Reag W"],null,null,null,null,null,null,null,null,null,null,null,null],[["Sam 3","Reag X"],["Sam 3","Reag Y"],["Sam 3","Reag Y"],["Sam 3","Reag Y"],["Sam 3","Reag Y"],["Sam 3","Reag Z"],["Sam 3","Reag Z"],["Sam 3","Reag Z"],["Sam 3","Reag W"],["Sam 3","Reag W"],["Sam 3","Reag W"],["Sam 3","Reag W"],null,null,null,null,null,null,null,null,null,null,null,null],[["Sam 4","Reag X"],["Sam 4","Reag Y"],["Sam 4","Reag Y"],["Sam 4","Reag Y"],["Sam 4","Reag Y"],["Sam 4","Reag Z"],["Sam 4","Reag Z"],["Sam 4","Reag Z"],["Sam 4","Reag W"],["Sam 4","Reag W"],["Sam 4","Reag W"],["Sam 4","Reag W"],null,null,null,null,null,null,null,null,null,null,null,null],[["Sam 5","Reag X"],["Sam 5","Reag Y"],["Sam 5","Reag Y"],["Sam 5","Reag Y"],["Sam 5","Reag Y"],["Sam 5","Reag Z"],["Sam 5","Reag Z"],["Sam 5","Reag Z"],["Sam 5","Reag W"],["Sam 5","Reag W"],["Sam 5","Reag W"],["Sam 5","Reag W"],null,null,null,null,null,null,null,null,null,null,null,null],[["Sam 6","Reag X"],["Sam 6","Reag Y"],["Sam 6","Reag Y"],["Sam 6","Reag Y"],["Sam 6","Reag Y"],["Sam 6","Reag Z"],["Sam 6","Reag Z"],["Sam 6","Reag Z"],["Sam 6","Reag W"],["Sam 6","Reag W"],["Sam 6","Reag W"],["Sam 6","Reag W"],null,null,null,null,null,null,null,null,null,null,null,null],[["Sam 7","Reag X"],["Sam 7","Reag Y"],["Sam 7","Reag Y"],["Sam 7","Reag Y"],["Sam 7","Reag Y"],["Sam 7","Reag Z"],["Sam 7","Reag Z"],["Sam 7","Reag Z"],["Sam 7","Reag W"],["Sam 7","Reag W"],["Sam 7","Reag W"],["Sam 7","Reag W"],null,null,null,null,null,null,null,null,null,null,null,null],[["Sam 8","Reag X"],["Sam 8","Reag Y"],["Sam 8","Reag Y"],["Sam 8","Reag Y"],["Sam 8","Reag Y"],["Sam 8","Reag Z"],["Sam 8","Reag Z"],["Sam 8","Reag Z"],["Sam 8","Reag W"],["Sam 8","Reag W"],["Sam 8","Reag W"],["Sam 8","Reag W"],null,null,null,null,null,null,null,null,null,null,null,null],[["Sam 9","Reag X"],["Sam 9","Reag Y"],["Sam 9","Reag Y"],["Sam 9","Reag Y"],["Sam 9","Reag Y"],["Sam 9","Reag Z"],["Sam 9","Reag Z"],["Sam 9","Reag Z"],["Sam 9","Reag W"],["Sam 9","Reag W"],["Sam 9","Reag W"],["Sam 9","Reag W"],null,null,null,null,null,null,null,null,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]]]')
                expect(plates.length).to eq(1)
            end
        end
    end
end