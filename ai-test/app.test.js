const request = require('supertest');
const app = require('./app');

// Unit Test
describe('POST /api/tasks (Create Task)', () => {
    
    it('ควรคืนค่า 400 Error หากข้อมูลไม่ผ่านเงื่อนไข Zod (เช่น ไม่ได้ส่ง title)', async () => {
        const res = await request(app)
            .post('/api/tasks')
            .send({
                category_id: 1,
                status_id: 2,
                created_by: 1
            });
            
        expect(res.statusCode).toEqual(400);
        expect(res.body.errors).toBeDefined();
        expect(res.body.errors[0].path[0]).toBe('title'); 
    });

    it('ควรคืนค่า 201 Success หากข้อมูลถูกต้องและผ่าน Zod Validation', async () => {
        const res = await request(app)
            .post('/api/tasks')
            .send({
                title: "Test Task Validation",
                description: "This is a test",
                category_id: 1,
                status_id: 2,
                created_by: 1
            });
            
        expect(res.statusCode).toEqual(201);
        expect(res.body.message).toBe("Task created successfully!");
    });
});