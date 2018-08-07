import numpy as np
import cv2

capture = cv2.VideoCapture(0)

while(True):
    # original...
    ret, frame = capture.read()

    # grayscale...
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # contours...
    ret,thresh = cv2.threshold(gray,127,255,0)
    image, contours, hierarchy = cv2.findContours(thresh,cv2.RETR_TREE,cv2.CHAIN_APPROX_SIMPLE)
    img = cv2.drawContours(frame.copy(), contours, -1, (255,255,0), 3)

    # displaying...
    cv2.imshow("Webcam Contours", img)
    cv2.imshow("Webcam Grayscale", gray)
    cv2.imshow("Webcam Original", frame)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

capture.release()
cv2.destroyAllWindows()