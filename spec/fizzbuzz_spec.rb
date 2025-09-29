# spec/fizzbuzz_spec.rb

RSpec.describe "fizzbuzz.rb" do
  describe "output" do
    it "prints Fizz when divisible by 3", points: 1 do
      allow_any_instance_of(Object).to receive(:rand).and_return(9)
      output = run_script_and_capture_lines("fizzbuzz.rb")
      expect(output).to include("Fizz")
    end

    it "prints Buzz when divisible by 5", points: 1 do
      allow_any_instance_of(Object).to receive(:rand).and_return(10)
      output = run_script_and_capture_lines("fizzbuzz.rb")
      expect(output).to include("Buzz")
    end

    it "prints FizzBuzz when divisible by both 3 and 5", points: 1 do
      allow_any_instance_of(Object).to receive(:rand).and_return(15)
      output = run_script_and_capture_lines("fizzbuzz.rb")
      expect(output).to include("FizzBuzz")
    end

    it "prints the number otherwise", points: 1 do
      allow_any_instance_of(Object).to receive(:rand).and_return(7)
      output = run_script_and_capture_lines("fizzbuzz.rb")
      expect(output).to include("7")
    end
  end

    describe "code" do
    let(:source_code) { strip_comments(File.read("fizzbuzz.rb")) }

    it "uses rand with a range", points: 1 do
      expect(source_code).to match(/rand\(1\.\.100\)/),
        "Expected to use rand(1..100) to pick the number"
    end

    it "uses modulo operator for divisibility", points: 1 do
      expect(source_code).to match(/%/),
        "Expected to use % to check divisibility"
    end

    it "uses if/elsif/else branching", points: 1 do
      expect(source_code).to match(/\bif\b/).and match(/\belsif\b/).and match(/\belse\b/),
        "Expected to use if/elsif/else to branch logic"
    end
  end
end
