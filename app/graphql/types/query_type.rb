Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :user, function: Functions::FindRecord.new(model: User, type: Types::UserType)
  field :post, function: Functions::FindRecord.new(model: Post, type: Types::PostType)
end
