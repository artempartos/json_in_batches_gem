module JsonBatchExtend
  extend ActiveSupport::Concern

  def to_json_in_batches(io = nil)
    io = io || IO.new(STDOUT.fileno)
    find_each do |record|
      io.write record.to_json
    end
    io.close
  end

end

ActiveRecord::Relation.send(:include, JsonBatchExtend)
