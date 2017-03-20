# accepts_nested_attributes_for

In order to use accepts_nested_attribute_for with strong parameters, you will need to specify which nested attributes should be whitelisted.

```
class Person
  has_many :pets
  accepts_nested_attributes_for :pets
end

class PeopleController < ApplicationController
  def create
    Person.create(person_params)
  end

  # ...

  private

  def person_params
    params.require(:person).permit(:name, :age, pets_attributes: [:name, :category])
  end
end
```

Keywords are self-explanatory, but just in case, you can find more information about strong parameters in the Rails Action Controller guide. http://edgeguides.rubyonrails.org/action_controller_overview.html#strong-parameters
