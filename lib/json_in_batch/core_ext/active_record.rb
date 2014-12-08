module JsonBatchExtend
  extend ActiveSupport::Concern

  def to_json_in_batches(io = nil)
    io = io || IO.new(STDOUT.fileno)
    find_each do |x|
      io.write x.to_json
    end
    io.close
  end

end

ActiveRecord::Relation.send(:include, JsonBatchExtend)
