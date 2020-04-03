class Function < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :user_id }, format: { with: /\A[0-9a-z_]+\z/i }
  validates :usage, presence: true
  validates :code, presence: true
  validates :user, presence: true

  belongs_to :user

  before_validation :function_name

  def to_param
    name
  end

  def self.from_param(param)
    find_by(name: param)
  end

  private

  def find_first_function(ast)
    return ast.children.first.to_s if ast.instance_of?(RubyVM::AbstractSyntaxTree::Node) && ast.type == :DEFN

    return unless ast.instance_of?(RubyVM::AbstractSyntaxTree::Node)

    ast.children.each do |child|
      node = find_first_function(child)
      return node if node
    end
    nil
  end

  def function_name
    self.name = find_first_function(RubyVM::AbstractSyntaxTree.parse(code))
  rescue SyntaxError
    errors.add(:code, :syntax_error)
  end
end
