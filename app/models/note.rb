class Note < ApplicationRecord
    alias_attribute :message, :content
    before_create :generate_slug
    has_secure_password validations: false
    attr_accessor :author
    validates_each :password, :email, :if => Proc.new{ !(author && author.pro) } do |record, attr, value|
      record.errors.add(attr, "can only be used if you are purchase privnote pro") unless value.blank?
    end
    private
    def generate_slug
      loop do
        self.slug = SecureRandom.urlsafe_base64
        break unless Note.where(slug: slug).exists?
      end
    end
end
