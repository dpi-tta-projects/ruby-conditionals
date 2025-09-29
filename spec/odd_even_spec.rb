# spec/odd_even_spec.rb

RSpec.describe "odd_even.rb" do
  describe "output" do
    it "prints the correct message for an even number", points: 1 do
      allow_any_instance_of(Object).to receive(:rand).and_return(4)
      output = run_script_and_capture_lines("odd_even.rb")
      expect(output).to include("The number 4 is even!"),
        "Expected program to print 'The number 4 is even!' when rand returns 4"
    end

    it "prints the correct message for an odd number", points: 1 do
      allow_any_instance_of(Object).to receive(:rand).and_return(7)
      output = run_script_and_capture_lines("odd_even.rb")
      expect(output).to include("The number 7 is odd!"),
        "Expected program to print 'The number 7 is odd!' when rand returns 7"
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("odd_even.rb")) }

    it "uses rand with a range", points: 1 do
      expect(source_code).to match(/rand\(1\.\.20\)/),
        "Expected to use rand(1..20) to pick the number"
    end

    it "uses either even?/odd? OR modulo to determine parity", points: 1 do
      uses_parity_method = source_code.match?(/\.even\?|\.odd\?/)
      uses_modulo        = source_code.match?(/%.*2/)

      expect(uses_parity_method || uses_modulo).to be(true),
        "Expected the code to use either .even?/.odd? or % 2 to check parity"
    end
  end
end
