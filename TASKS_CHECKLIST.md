# Tasks Feature - Exploratory Test Scenarios

This document outlines high-level happy path test cases for the **Tasks** feature in SimplePractice, structured across key functional areas based on exploratory testing analysis.

---

## 📋 Table of Contents
1. [Creation](#1-creation)
2. [Editing](#2-editing)
3. [Deletion](#3-deletion)
4. [Completion](#4-completion)
5. [Filtering](#5-filtering)
6. [Prioritization](#6-prioritization)
7. [Attachments](#7-attachments)
8. [Quick Task](#8-quick-task)
9. [Due On & Schedule](#9-due-on--schedule)

---

## 1. Creation

- [ ] Task can be created successfully with minimum info (Task name).
   - [ ] Task name allows CJK characters.
- [ ] Task can be created successfully with full info.
   - [ ] If full info is provided, the due date/time and client should be visible from the task preview on the task list.
   - [ ] If client info is provided, the task preview should give a direct link to the client’s records.
- [ ] Task still shows after page is refreshed.

## 2. Editing
- [ ] If any of the fields of the task are edited, the changes can be successfully saved.
   - [ ] Client info can be removed.
   - [ ] Due date/time can be removed.
- [ ] “Discard unsaved changes?” confirmation modal displays after edits are made to the task and the “Cancel” button is clicked.
- [ ] If the task is edited, the changes can be successfully discarded and the task will not show them.

## 3. Deletion
- [ ] “Delete” button is visible on previously created task.
- [ ] An incomplete task can be successfully deleted.
- [ ] A completed task can be successfully deleted.

## 4. Completion
- [ ] When an Incomplete task is marked as completed, it should appear on the “Complete” list.
- [ ] When an Incomplete task is marked as completed, a green check should appear on the left side.
- [ ] A completed task should show the completion date on the task preview.
- [ ] A completed task should show the completion date on the task panel when the task is expanded.

## 5. Filtering
- [ ] When navigating to the Tasks menu, the default filtering is set to “Incomplete” and “Custom”.
- [ ] When filtering tasks by “Completed”, only completed tasks show on the task list.
- [ ] When filtering tasks by “All”, both completed and incomplete tasks show on the task list.
- [ ] When filtering by “Due date”, the tasks that are closer to its due date should show at the top of the list.
- [ ] When filtering by “Date created”, the “oldest” tasks should show at the top of the list.
- [ ] When filtering by “Priority”, the tasks with should show in order of priority (e.g. first Critical, then High, followed by Medium and Low).
- [ ] When filtering by “Custom”, the “newest” tasks should show at the top of the list.
- [ ] Two filters can be applied to the task list and results show in correct order (e.g. if filtered by “Complete” and “Date created”, results should only show completed tasks with the oldest ones being at the top of the list).

## 6. Prioritization
- [ ] If priority is different than “None”, the UI correctly renders the element to the right of the task preview according to the priority selected.
   - [ ] Intense red for Critical.
   - [ ] Soft red for High.
   - [ ] Orange for Medium.
   - [ ] Green for Low.

## 7. Attachments
- [ ] If an attachment is added to a task, it can be successfully renamed.
- [ ] If an attachment is added to a task, it can be successfully deleted.
- [ ] If an attachment is added to a task, it can be successfully downloaded.
- [ ] Attachment can be added by drag-and-drop.
- [ ] Attachment can be added by selecting a file from local storage.

## 8. Quick task
- [ ] When creating a new quick task, the page shows a suggestion for its name.
- [ ] More info can be added to a created quick task by clicking on it and expanding it.

## 9. Due on
- [ ] If there’s a due date for the task, it is shown on the task list.
   - [ ] If there’s also a due time, it shows after the due date.
- [ ] If there’s a past due date for the task and it was not completed on time, is shows on red.