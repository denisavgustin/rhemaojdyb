class PlatesController < ApplicationController
    def index
        @permitted_params = permitted_params
        begin
        @plates = Wells.optimize_placement(permitted_params[:plate_size].to_i,eval(permitted_params[:samples_array]),eval(permitted_params[:reagents_array]),eval(permitted_params[:replicates]))
        rescue
            # failed, TODO for some other time :)
        end
    end

    private
    def permitted_params
        params.permit(:plate_size, :samples_array, :reagents_array, :replicates)
    end

end