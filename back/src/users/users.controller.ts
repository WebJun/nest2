import { Get, Controller, Render, Post, Body } from '@nestjs/common';
import { UsersService } from './users.service';
import { User } from './user.entity';

@Controller('/')
export class UsersController {
    constructor(private readonly userService: UsersService) { }

    @Get('/')
    @Render('users_index')
    async index() {
        let users = await this.userService.findAll();
        return { users: users }
    }

    // RESTFul API
    @Get('users')
    async findAll(): Promise<User[]> {
      return (await this.userService.findAll()).reverse()
    }
    @Post('users')
    async create(@Body() user: User): Promise<User> {
        console.log(user)
        return this.userService.create(user);
    }
}