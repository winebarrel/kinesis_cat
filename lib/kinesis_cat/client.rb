class KinesisCat::Client
  def initialize(client, options)
    @client = client
    @options = options
  end

  def put(data, options = {})
    options = @options.merge(options)
    partition_key = options[:partition_key]
    partition_key ||= Time.now.to_i.to_s

    if data.kind_of?(Hash)
      data = JSON.dump(data)
    end

    @client.put_record(
      :stream_name => options.fetch(:stream_name),
      :data => data,
      :partition_key => partition_key,
    )
  end
end
