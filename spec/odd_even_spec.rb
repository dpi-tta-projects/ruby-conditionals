# spec/odd_even_spec.rb

RSpec.describe "odd_even.rb" do
  describe "output" do
    it "prints whether the number is even or odd", points: 1 do
      output = run_script_and_capture_lines("odd_even.rb")

      expect(output.any? { |line| line.match?(/The number \d+ is (even|odd)!/) })
        .to be(true), "Expected output to mention whether the number is even or odd"
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("odd_even.rb")) }

    it "uses rand with a range", points: 1 do
      expect(source_code).to match(/rand\(1\.\.20\)/),
        "Expected to use rand(1..20) to pick the number"
    end

    it "uses even? or odd? methods", points: 1 do
      expect(source_code).to match(/\.even\?\b|\.odd\?\b/),
        "Expected to check evenness using .even? or .odd?"
    end
  end
end
