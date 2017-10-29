class NoteMailer < ApplicationMailer
    default from: 'notifications@example.com'
    
     def note_opened_email(note)
       @note = note
       @time = DateTime.now
       @url  = notes_url
       mail(to: @note.email, subject: 'Welcome to My Awesome Site')
     end
end
