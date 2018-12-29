class BoxKindsController < ApplicationController
  def index
    @boxkinds = BoxKind.all
  end
end
