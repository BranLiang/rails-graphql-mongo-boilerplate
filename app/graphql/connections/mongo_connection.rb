class Connections::MongoConnection < GraphQL::Relay::BaseConnection
  # derive a cursor from `item`
  def cursor_from_node(item)
    encode(item.id.to_str)
  end

  private

  # apply `#first` & `#last` to limit results
  def paged_nodes
    return @paged_nodes if defined? @paged_nodes
    # binding.pry
    @paged_nodes = sliced_nodes
    @paged_nodes = if first
                     @paged_nodes.limit(first)
                   elsif last
                     @paged_nodes.desc(:id).limit(last)
                   else
                     @paged_nodes.limit(10)
                   end
  end

  # apply cursor, order, filters, etc
  # to get a subset of matching objects
  def sliced_nodes
    return @sliced_nodes if defined? @sliced_nodes

    @sliced_nodes = nodes
    @sliced_nodes = @sliced_nodes.where(:id.gt => decode(after)) if after
    @sliced_nodes = @sliced_nodes.where(:id.lt => decode(before)) if before
  end
end
