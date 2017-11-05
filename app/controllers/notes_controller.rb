class NotesController < ApplicationController
    #GET /notes
    def new
        @note = Note.new
    end
    #POST /notes
    def create
        if request.content_type =~ /xml/
            params[:message] = Hash.from_xml(request.body.read)["message"]
            note = Note.create(note_params_api)
            render xml:
            '<?xml version = "1.0" encoding = "UTF-8" standalone ="yes"?>' +
            '<url>' +
                notes_url + note.slug + "/raw" +
            '</url>';
        elsif request.content_type =~ /json/
            note = Note.create(note_params_api)
            render json: {url: notes_url + note.slug + '/raw'}
        elsif request.content_type =~ /form/
            @note = Note.new(note_params)
            @note.author = current_user
            if @note.save
                redirect_to notes_url + @note.slug + '/info'
            else
                @errors = @note.errors
                render 'new'
            end
        else
            head 415
        end
    end
    def info
        render "link_info", locals: {url: notes_url + params[:slug]}
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
        if !@note 
            head 404
        elsif @note.password_digest && !@note.authenticate(params[:password])
            head 401
        else
            @note.destroy        
            render plain: @note.content
        end
        #NoteMailer.note_opened_email(@note).deliver_now
    end

    private         
    
    def note_params
        params.require(:note).permit(:content,:message ,:email, :password)
    end 

    def note_params_api
        params.permit(:content, :message, :email, :password)
    end 

end
