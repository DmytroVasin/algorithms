# https://telegra.ph/UniLecs-130-1-Razbienie-chisla-10-02

# http://acm.mipt.ru/twiki/bin/view/Curriculum/FIVTLecturesTerm1Lecture6

class Ndivision

  def call(num)
    results = []
    generate(0, num, num, results)
  end

  private

  def generate(number)
    return if number < 0

    if number.zero?
      # Success case... print all!
    end

    while number.nonzero?
      generate(number)
    end
  end

end


Ndivision.new.call(3)
