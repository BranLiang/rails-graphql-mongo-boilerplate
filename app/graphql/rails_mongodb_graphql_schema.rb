RailsMongodbGraphqlSchema = GraphQL::Schema.define do
  resolve_type ->(obj, _ctx) {
    "Types::#{obj.class}Type".constantize
  }

  # mutation(Types::MutationType)
  query(Types::QueryType)
end
