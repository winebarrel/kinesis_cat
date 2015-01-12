describe KinesisCat::Client do
  subject(:client) do
    described_class.new(kinesis, stream_name: stream_name, partition_key: partition_key)
  end

  let(:kinesis) { Aws::Kinesis::Client.new }
  let(:stream_name) { 'STREAM_NAME' }
  let(:partition_key) { nil }
  let(:now) { Time.parse('2015/01/12') }

  context 'when put json' do
    let(:data) { {'key' => 'val'} }

    context 'without partition_key' do
      before do
        expect(kinesis).to receive(:put_record).with(
          stream_name: stream_name,
          data: JSON.dump(data),
          partition_key: now.to_i.to_s,
        )
      end

      it do
        Timecop.freeze(now) do
          client.put(data)
        end
      end
    end

    context 'with partition_key' do
      let(:partition_key) { 'PARTITION_KEY' }

      before do
        expect(kinesis).to receive(:put_record).with(
          stream_name: stream_name,
          data: JSON.dump(data),
          partition_key: partition_key
        )
      end

      it do
        Timecop.freeze(now) do
          client.put(data)
        end
      end
    end
  end

  context 'when put string' do
    let(:data) { 'London Bridge Is Falling Down' }

    context 'without partition_key' do
      before do
        expect(kinesis).to receive(:put_record).with(
          stream_name: stream_name,
          data: data,
          partition_key: now.to_i.to_s,
        )
      end

      it do
        Timecop.freeze(now) do
          client.put(data)
        end
      end
    end

    context 'with partition_key' do
      let(:partition_key) { 'PARTITION_KEY' }

      before do
        expect(kinesis).to receive(:put_record).with(
          stream_name: stream_name,
          data: data,
          partition_key: partition_key
        )
      end

      it do
        Timecop.freeze(now) do
          client.put(data)
        end
      end
    end
  end
end
