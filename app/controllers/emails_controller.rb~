class EmailsController < InheritedResources::Base
  respond_to :xml, :only => [:index]

	def index
		@emails = Account.find(params[:account_id]).list_emails

		super do |format|
      @emails.each do |email|
        def email.to_xml(options = {})
          builder = options[:builder]
          builder.tag!('email') do
            builder.id 0
            builder.name self
          end
        end
      end
      format.xml { render :xml => @emails.to_xml }
    end
  end
end
