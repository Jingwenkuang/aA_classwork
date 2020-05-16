class CatsController < ApplicationController

    def index
        @cats = Cat.all   
        render :index 
    end

    def show
        @cat = Cat.find(params[:id])
        if @cat
            render :show
        else
            redirect_to :cats_url
        end
    end

    def new 
        
        render :new
    end

    def edit
        @cat = Cat.find(params[:id])
        render :edit
    end
end

#params {name: ?, color: ?, sex: ?, desctription: ?}