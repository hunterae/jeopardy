class Question < ActiveRecord::Base
  attr_accessible :text, :answer, :value, :daily_double, :answered, :mode, :other_answers

  belongs_to :topic

  def set_as_daily_double
    Question.transaction do
      Question.where(:mode => self.mode).update_all(:daily_double => false)
      self.daily_double = true
      self.save!
    end
  end

  def self.import_from_csv(csv_file)
    options = []
    Topic.destroy_all
    Question.destroy_all
    csv = CSV.parse(csv_file) do |row|
      topic_name = get_csv_value(row[0])
      question = get_csv_value(row[1])
      answer = get_csv_value(row[2])
      value = get_csv_value(row[3])
      mode = get_csv_value(row[4])
      other_answers = get_csv_value(row[5])
      daily_double = get_csv_value(row[6]) == "TRUE"
      next unless topic_name

      topic = Topic.find_or_create_by_name_and_mode(topic_name, mode)
      topic.questions.create(:mode => mode, :text => question, :answer => answer, :value => value, :daily_double => daily_double, :other_answers => other_answers)
    end
  end

  private
  def self.get_csv_value(cell_contents)
    return nil if cell_contents.blank?
    return cell_contents.strip
  end
end
