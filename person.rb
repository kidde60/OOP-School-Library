class Person 
    def initialize(id, name = 'Unknown', age, parent_permission = true)
        @id = Random.rand(1..1000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end
    # Getters
    def id
        @id
    end
    def name
        @name
    end
    def age
        @age
    end

    # Setters
    def name(value)
        @name = value
    end
    def age(value)
        @age = value
    end
    
    def can_use_services?
        @is_of_age || @parent_permission     
    end

    private
    def is_of_age?
        @age >= 18
    end
end    