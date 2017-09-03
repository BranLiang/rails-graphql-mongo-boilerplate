Types::PostType = GraphQL::ObjectType.define do
  name 'Post'

  interfaces [Interfaces::ModelGenericInterface]
  field :title, types.String
  field :author, Types::UserType, property: :user
end
