require 'spec_helper'

describe "Creating todo lists" do 
	it "redirect to the todo list index page on success" do
		visit "/todo_lists" 
		click_link "New Todo list"
		expect(page).to have_content("New todo_list")

		fill_in "Title", with: "My todo list"
		fill_in "Description", with: "This is what I am doing today."
		click_button "Create Todo list"

		expect(page).to have_content("My todo list")
	end

	it "display an errror when the todo list has no title" do
	 	expect(TodoList.count).to eq(0)

	 	visit "/todo_lists" 
		click_link "New Todo list"
		expect(page).to have_content("New todo_list")

		fill_in "Title", with: "My todo list"
		fill_in "Description", with: "This is what I am doing today."
		click_button "Create Todo list"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists" 
		expect(page).to_not have_content("This is what I am doing today.")
	end

		it "display an errror when the todo list has 3 character" do
	 	expect(TodoList.count).to eq(0)

	 	visit "/todo_lists" 
		click_link "New Todo list"
		expect(page).to have_content("New todo_list")

		fill_in "Title", with: "Hi"
		fill_in "Description", with: "This is what I am doing today."
		click_button "Create Todo list"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists" 
		expect(page).to_not have_content("This is what I am doing today.")
	end

	it "display an errror when the todo list has no description" do
	 	expect(TodoList.count).to eq(0)

	 	visit "/todo_lists" 
		click_link "New Todo list"
		expect(page).to have_content("New todo_list")

		fill_in "Title", with: "Grocery list"
		fill_in "Description", with: ""
		click_button "Create Todo list"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists" 
		expect(page).to_not have_content("This is what I am doing today.")
	end

	it "display an errror when the todo list has 5 character" do
	 	expect(TodoList.count).to eq(0)

	 	visit "/todo_lists" 
		click_link "New Todo list"
		expect(page).to have_content("New todo_list")

		fill_in "Title", with: "Grocery list"
		fill_in "Description", with: "This is what I am doing today."
		click_button "Create Todo list"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists" 
		expect(page).to_not have_content("This is what I am doing today.")
	end
end 
