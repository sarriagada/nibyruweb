class ContactsController < InheritedResources::Base
  actions :new, :create

  def create
  	@contact = Contact.new(params[:contact]) if params[:contact]
  	if @contact.save
		ContactMailer.contact_response(@contact).deliver
		ContactMailer.new_contact(@contact).deliver

		redirect_to root_path, notice: "Gracias por comunicarse."
  	else
		redirect_to root_path, notice: "Error."
	end
  end
end