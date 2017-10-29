class NotesController < ApplicationController
    #GET /notes
    def new
        @note = Note.new
    end
    #POST /notes
    def create
        @note = Note.new(note_params)
        @note.author = current_user
        if @note.save
            render "link_info", locals: {url: notes_url + @note.slug};           
        else
            @errors = @note.errors
            render 'index'
        end
    end
    #GET /notes/:slug
    def show 
        @note = Note.find_by slug: params[:slug]
        if @note.nil?
            render "note_deleted"
        end
    end
    def raw
        @note = Note.find_by slug: params[:slug]
        if !@note.authenticate(params[:password])
            head 401
        else
            @note.destroy        
            render plain: @note.content
        end
        #NoteMailer.note_opened_email(@note).deliver_now
    end

    private
    
    def note_params
        params.require(:note).permit(:content, :email, :password)
    end 

end
