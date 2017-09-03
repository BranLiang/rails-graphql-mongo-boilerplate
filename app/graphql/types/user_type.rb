Types::UserType = GraphQL::ObjectType.define do
  name 'User'

  interfaces [Types::ModelGenericType]
  field :name, !types.String
end
