const express = require('express');
const { z } = require('zod');

const app = express();
app.use(express.json());

// Validate ข้อมูล
const taskSchema = z.object({
    title: z.string().min(1, "Title is required"),
    description: z.string().optional(),
    category_id: z.number().int("Category ID must be an integer"),
    status_id: z.number().int("Status ID must be an integer"),
    created_by: z.number().int("Created By ID must be an integer"),
    assigned_to: z.number().int().optional(),
    due_date: z.string().datetime().optional()
});

app.post('/api/tasks', (req, res) => {
    try {
        const validatedData = taskSchema.parse(req.body);
        
        res.status(201).json({
            message: "Task created successfully!",
            data: validatedData
        });
    } catch (error) {
        if (error.name === 'ZodError') {
            return res.status(400).json({ errors: error.issues });
        }
        res.status(500).json({ error: "Internal Server Error" });
    }
});

module.exports = app;