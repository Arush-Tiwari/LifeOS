import 'package:flutter/material.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../config/theme/app_text_styles.dart';

class PinSetupScreen extends StatefulWidget {
  const PinSetupScreen({Key? key}) : super(key: key);

  @override
  State<PinSetupScreen> createState() => _PinSetupScreenState();
}

class _PinSetupScreenState extends State<PinSetupScreen> {
  late TextEditingController _pinController;
  String _enteredPin = '';
  bool _isConfirming = false;
  String _firstPin = '';

  @override
  void initState() {
    super.initState();
    _pinController = TextEditingController();
  }

  void _onPinEntered(String digit) {
    if (_enteredPin.length < 6) {
      setState(() {
        _enteredPin += digit;
      });

      if (_enteredPin.length == 6) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (_isConfirming) {
            if (_enteredPin == _firstPin) {
              _showSuccessDialog();
            } else {
              _showErrorDialog('PINs do not match');
              setState(() {
                _enteredPin = '';
              });
            }
          } else {
            setState(() {
              _firstPin = _enteredPin;
              _isConfirming = true;
              _enteredPin = '';
            });
          }
        });
      }
    }
  }

  void _onDeletePressed() {
    if (_enteredPin.isNotEmpty) {
      setState(() {
        _enteredPin = _enteredPin.substring(0, _enteredPin.length - 1);
      });
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('PIN Set Successfully'),
        content: const Text('Your PIN has been saved securely.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.go('/dashboard');
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isConfirming ? 'Confirm PIN' : 'Set PIN'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              _isConfirming ? 'Confirm your PIN' : 'Create a 6-digit PIN',
              style: AppTextStyles.heading3,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                6,
                (index) => Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: index < _enteredPin.length
                          ? AppColors.primary
                          : AppColors.lightBorder,
                      width: 2,
                    ),
                  ),
                  child: index < _enteredPin.length
                      ? const Center(
                          child: Text('•',
                              style: TextStyle(
                                  fontSize: 24, color: AppColors.primary)))
                      : null,
                ),
              ),
            ),
            const Spacer(),
            // PIN Pad
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  for (int row = 0; row < 3; row++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int col = 0; col < 3; col++)
                            _PinButton(
                              number: (row * 3 + col + 1).toString(),
                              onPressed: () =>
                                  _onPinEntered((row * 3 + col + 1).toString()),
                            ),
                        ],
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(width: 60),
                      _PinButton(
                        number: '0',
                        onPressed: () => _onPinEntered('0'),
                      ),
                      GestureDetector(
                        onTap: _onDeletePressed,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.lightBorder,
                              width: 2,
                            ),
                          ),
                          child: const Icon(Icons.backspace_outlined),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }
}

class _PinButton extends StatelessWidget {
  final String number;
  final VoidCallback onPressed;

  const _PinButton({
    required this.number,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.lightBorder,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            number,
            style: AppTextStyles.heading4,
          ),
        ),
      ),
    );
  }
}
