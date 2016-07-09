require 'spec_helper'

describe AsJsonWithIncludes do
  it 'has a version number' do
    expect(AsJsonWithIncludes::VERSION).not_to be nil
  end

  describe 'AsJsonWithIncludes::CalculationsPatch' do
    class Dummy
      extend AsJsonWithIncludes::CalculationsPatch
    end
    it 'convert active record includes to as_json includes' do
      input = [:a, :b, :c, :d, {:e => {:f => [:g, :h]}}]
      expected = [:a, :b, :c, :d, {:e => {:include => {:f => {:include => [:g, :h]}}}}]
      expect(Dummy.convert_activerecord_includes_to_json_includes(input)).to eql(expected)
    end
  end

  describe 'AsJsonWithIncludes::BasePatch' do
    # TODO
  end
end
