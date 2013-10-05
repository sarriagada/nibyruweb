class ContactMailer < ActionMailer::Base
  default from: "contacto@nibyru.com"

  def contact_response(contact)
  	@contact = contact
  	mail(to: contact.email, subject: "Gracias por comunicarse")
  end

  def new_contact(contact)
  	@contact = contact
  	mail(to: "contacto@nibyru.com", subject: "Contacto", from: contact.email)
  end
end
