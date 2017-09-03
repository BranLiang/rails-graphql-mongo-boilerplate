Interfaces::ModelGenericInterface = GraphQL::InterfaceType.define do
  name 'ModelGenericInterface'
  description 'Generic fields for model, including id, created_at, updated_at'

  field :id, !types.ID
  field :created_at, types.String, 'The date time object is created.'
  field :updated_at, types.String, 'The date time object attribute is updated.'
end
