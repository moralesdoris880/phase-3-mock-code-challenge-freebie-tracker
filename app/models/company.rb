class Company < ActiveRecord::Base
    has_many :freebies
    def freebies
        Freebie.all
    end
    def devs
        items=Freebie.where(company_id:self.id)
        items.map do |item|
            Dev.find_by(id:item.dev_id)
        end
    end
end
