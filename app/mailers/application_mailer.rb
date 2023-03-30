class ApplicationMailer < ActionMailer::Base
  # TODO: Set up real email at this address. (Currently it shows my gmail.)
  default from: "TuneStreet <info@tunestreet.org>"
  layout "mailer"
end
