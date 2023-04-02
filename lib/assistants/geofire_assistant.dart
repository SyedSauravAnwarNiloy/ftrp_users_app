import '../models/active_nearby_available_deliverymen.dart';

class GeoFireAssistant
{
  static List<ActiveNearbyAvailableDeliverymen> activeNearbyAvailableDeliverymenList = [];

  static void deleteOfflineDeliverymanFromList(String deliverymanId)
  {
    int indexNumber = activeNearbyAvailableDeliverymenList.indexWhere((element) => element.deliverymanId == deliverymanId);
    activeNearbyAvailableDeliverymenList.remove(indexNumber);
  }

  static void updateActiveNearbyAvailableDeliverymenLocation(ActiveNearbyAvailableDeliverymen deliverymanWhoMove)
  {
    int indexNumber = activeNearbyAvailableDeliverymenList.indexWhere((element) => element.deliverymanId == deliverymanWhoMove.deliverymanId);

    activeNearbyAvailableDeliverymenList[indexNumber].locationLatitude = deliverymanWhoMove.locationLatitude;
    activeNearbyAvailableDeliverymenList[indexNumber].locationLongitude = deliverymanWhoMove.locationLongitude;
  }
}