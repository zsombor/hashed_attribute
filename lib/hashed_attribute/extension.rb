module HashedAttribute
  module Extension
    def hashed_attribute(attr)
      def self.hash_attr value
        Digest::SHA1.hexdigest(value.downcase)[0,7].to_i(16)
      end

      before_validation do
        str_value = read_attribute attr
        if str_value
          write_attribute "#{attr}_hash", self.class.hash_attr(str_value)
        end
      end

      define_singleton_method "scoped_by_#{attr}" do |a|
        where(attr => a,
              "#{attr}_hash" => hash_attr(a) )
      end

      define_singleton_method "find_by_#{attr}" do |a|
        send("scoped_by_#{attr}", a).first
      end
    end
  end
end

