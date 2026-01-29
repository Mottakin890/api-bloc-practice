import 'package:api_bloc_practice/common/widgets/icon_row.dart';
import 'package:api_bloc_practice/domain/model/user_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserCard extends StatelessWidget {
  UserModel userModel;
  UserCard({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[100],
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha:0.08),
              blurRadius: 16,
              offset: Offset(4, 4),
            ),
            BoxShadow(
              color: Colors.white.withValues(alpha:0.8),
              blurRadius: 16,
              offset: Offset(-4, -4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Name and ID Row with Company Chip
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha:0.1),
                          blurRadius: 12,
                          offset: Offset(3, 3),
                        ),
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 12,
                          offset: Offset(-3, -3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        userModel.id.toString(),
                        style: TextStyle(
                          color: Colors.blueGrey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userModel.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blueGrey[800],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 6),
                        Text(
                          '@${userModel.username}',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                            fontStyle: FontStyle.italic,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Chip(
                    label: Text(
                      userModel.company.name,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    backgroundColor: Colors.blueGrey[600],
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide.none,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.grey[300]!,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Contact Info
              IconRow(
                icon: Icons.email_outlined,
                label: 'Email',
                value: userModel.email,
              ),
              SizedBox(height: 8),
              IconRow(
                icon: Icons.phone_outlined,
                label: 'Phone',
                value: userModel.phone,
              ),
              SizedBox(height: 8),
              IconRow(
                icon: Icons.language_outlined,
                label: 'Website',
                value: userModel.website,
              ),
              SizedBox(height: 8),
              IconRow(
                icon: Icons.location_on_outlined,
                label: 'Address',
                value:
                    '${userModel.address.street}, ${userModel.address.suite}, ${userModel.address.city} - ${userModel.address.zipcode}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
