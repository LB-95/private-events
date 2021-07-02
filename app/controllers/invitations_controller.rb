class InvitationsController < ApplicationController
    def create
      event = Event.find(params[:event_id])
      invitation = current_user.invitations.new(event: event)
        
      if invitation.save
            flash[:notice] = "You are attending #{event.title}."
            redirect_to event
          else
            flash[:alert] = 'Could not enroll.'
            redirect_to event
          end
    end
end