class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    @contact.company_id = params[:company_id]

    @contact.save

    redirect_to company_path(@contact.company)
  end

private

  def contact_params
    params.require(:contact).permit(:fname, :lname, :position, :email)
  end

end
