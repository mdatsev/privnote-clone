class NotesController < ApplicationController
    #GET /notes
    def index
        @all_notes = Note.all
    end
    #POST /notes
    def create
        Note.new({content: params[:content] , slug: "doesnt work"}).save
        redirect_to "/notes"
    end
end
