require 'csv'

module CSVExt
  class CSVReader

    def initialize(path)
      @path = path
    end

    def to_hash
      csv.map {|a| a.to_h } # skipping first row (keys)
    end

    private

    def csv
      @csv ||= CSV.read(@path, headers: true, header_converters: :symbol, converters: [:all])
    end

  end
end