class NotesController < ApplicationController
    #GET /notes
    def index
        @all_notes = Note.all
    end
    #POST /notes
    def create
        note = Note.new({content: params[:content]})
        note.save
        render "link_info", :locals => {url: request.base_url + "/" + note.slug};
    end
    #GET /notes/:slug
    def show
        @note = Note.find_by slug: params[:slug]
    end
end
