# spec/weather_spec.rb

RSpec.describe "weather.rb" do
  describe "output" do
    it "prints Too hot 🥵 when above 85", points: 1 do
      allow_any_instance_of(Object).to receive(:rand).and_return(90)
      output = run_script_and_capture_lines("weather.rb")
      expect(output).to include("Too hot 🥵")
    end

    it "prints Nice out 😎 when between 60 and 85", points: 1 do
      allow_any_instance_of(Object).to receive(:rand).and_return(75)
      output = run_script_and_capture_lines("weather.rb")
      expect(output).to include("Nice out 😎")
    end

    it "prints A little chilly 🧥 when between 32 and 60", points: 1 do
      allow_any_instance_of(Object).to receive(:rand).and_return(45)
      output = run_script_and_capture_lines("weather.rb")
      expect(output).to include("A little chilly 🧥")
    end

    it "prints Brrr ❄️ when 32 or below", points: 1 do
      allow_any_instance_of(Object).to receive(:rand).and_return(20)
      output = run_script_and_capture_lines("weather.rb")
      expect(output).to include("Brrr ❄️")
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("weather.rb")) }

    it "uses rand with a range", points: 1 do
      expect(source_code).to match(/rand\(0\.\.100\)/),
        "Expected to use rand(0..100) to pick the temperature"
    end

    it "prints the current temperature with string interpolation", points: 1 do
      expect(source_code).to match(/#\{.*\}/),
        "Expected to use string interpolation to print the temperature"
    end

    it "uses if/elsif/else branching", points: 1 do
      expect(source_code).to match(/\bif\b/).and match(/\belsif\b/).and match(/\belse\b/),
        "Expected to use if/elsif/else to branch logic"
    end
  end
end
