class Dev < ActiveRecord::Base
    has_many :freebies, through: :companies
    def freebies 
        Freebie.where(dev_id:self.id)
    end
    def companies
        #returns a collection of all the companies that the Dev has collected freebies from
        items=Freebie.where(dev_id:self.id)
        items.map do |item|
            Company.find_by(id:item.company_id)
        end
    end
end
