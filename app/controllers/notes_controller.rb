class NotesController < ApplicationController
    #GET /notes
    def index
        @all_notes = Note.all
    end
    #POST /notes
    def create
        note = Note.create({content: params[:content]})
        render "link_info", locals: {url: request.base_url + "/" + note.slug};
    end
    #GET /notes/:slug
    def show 
        @note = Note.find_by slug: params[:slug]
        if @note.nil?
            render "note_deleted"
        else
            @note.destroy        
        end
    end
end
