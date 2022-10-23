class ProductionsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    # NOTE: This is added to wrap the 'params' hash below:
    wrap_parameters format: []
    def index
        productions = Production.all()
        render json: productions, status: :ok
    end

    def show
        production = Production.find_by(id: params[:id])

        if production
            render json: production, except: [:id, :created_at, :updated_at], methods: [:title_director], status: :ok
        else 
            render json: {error: "production not found"}, status: :not_found
        end
    end

    def create
        # NOTE: I revised this line to instead use 'production_params' from the private method below:
        # production = Production.create(params)
        production = Production.create!(production_params)
        render json: production, status: :accepted
    end

    def update 
        # find
        production = Production.find_by(id: params[:id])
        # update
        if production 
            production.update(production_params)
            render json: production, status: :accepted
        else
            render json: { error: "Production not found" }, status: :not_found
        end
    end

    def destroy
        production = Production.find_by(id: params[:id])
        if production 
            production.destroy()
            head :no_content
        else
            render json: { error: "Production not found "}, status: :not_found
        end
    end

    private 
    # NOTE: This private method ONLY allows these parameter values to come inside these 'production_params'
    def production_params
        params.permit(:title, :genre, :budget, :image, :director, :ongoing, :description)
    end

    def render_unprocessable_entity(invalid)
        render json: { error: invalid.record.errors}, status: :unprocessable_entity        
    end
end
