import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn } from 'typeorm';

@Entity('users')
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ unique: true })
  email: string;

  @Column()
  password: string;

  @Column({ default: false })
  emailChecked: boolean;

  @Column({ default: true })
  twoFactorAuth: boolean;

  @CreateDateColumn()
  createdAt: Date;
}
