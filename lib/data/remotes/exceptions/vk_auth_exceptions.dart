part of 'vk_exception.dart';

class VKAuthAccessDeniedException implements VKException 
{
  final int code = 5;
  final String message;
  
  VKAuthAccessDeniedException(this.message);
}