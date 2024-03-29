module ApplicationHelper
  def button_class
    "p-3 bg-blue-500 hover:bg-blue-400 transition-ease text-white rounded inline-block"
  end

  def input_class
    "shadow-sm border border-gray-300 min-w-[300px] text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:placeholder-gray-400 dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light"
  end

  def label_class
    "block text-sm font-medium"
  end
end
