class CsvImportService
    require 'csv'
  
    def call(file)
      opened_file = File.open(file)
      options = { headers: true, col_sep: ',' }
      CSV.foreach(opened_file, **options) do |row|
  
        # map the CSV columns to your database columns
        info_hash = {}
        info_hash[:ord] = row['Orders']
        info_hash[:val] = row['Value']
        info_hash[:date] = row['date']
  
        Info.find_or_create_by!(info_hash)

      end
    end
  end